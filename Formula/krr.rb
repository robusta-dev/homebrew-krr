class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.26.3/krr-macos-latest-v1.26.3.zip"
        sha256 "ccb96f277254f823bd6d2ddff98ed666c0cef4d57be20eceae34b00a2027a418"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.26.3/krr-ubuntu-latest-v1.26.3.zip"
        sha256 "bdc634661d411371aa9f162435c5b7a823ce1c4b0b05702d2135f30e7d794568"
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
  
