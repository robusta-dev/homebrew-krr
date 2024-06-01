class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.8.3/krr-macos-latest-v1.8.3.zip"
        sha256 "a10bba8b55dc7fed4ca6e08dc6e208bb5fc9a4dbd76b46f96833796e41d5dfad"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.8.3/krr-ubuntu-latest-v1.8.3.zip"
        sha256 "ac20c1f0b93f275cce5b033e48a9e0426cfe2708568461cefcb06aaf004d10fb"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
        # our binaries are built with pyinstaller and the first executable run is very slow because it unzips packages
        # to work around that, we "warm up" the binary here during installation so it is fast when the user runs it for the first time
        system libexec/"krr", "version"
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
