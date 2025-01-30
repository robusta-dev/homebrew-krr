class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.21.0/krr-macos-latest-v1.21.0.zip"
        sha256 "9160ce9f3d94c2d9d3e2a6d434280cb5226a0dd874a25bda92b0ed33e9630190"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.21.0/krr-ubuntu-latest-v1.21.0.zip"
        sha256 "f1eadf2c60448e6f79673254ab42921c1f15320020d79ff814a0079cad315cd0"
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
  
