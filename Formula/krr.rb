class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.20.0/krr-macos-latest-v1.20.0.zip"
        sha256 "8d0822580b1715567b1771ffc03b23de04b6cb4b8278f5372b6cbfad13b0606c"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.20.0/krr-ubuntu-latest-v1.20.0.zip"
        sha256 "f76135ec20c4cd7bc89843f2f62abb1704189b51e33786c3d4549f8ade64e8ae"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
        # our binaries are built with pyinstaller and the first executable run is very slow because it unzips packages
        # to work around that, we "warm up" the binary here during installation so it is fast when the user runs it for the first timeo
        ohai "Running 'krr version' to warm up binary and extract compressed python libraries... this can take up to 60 seconds"
        system libexec/"krr", "version"
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
