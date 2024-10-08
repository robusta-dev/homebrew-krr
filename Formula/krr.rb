class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.16.0/krr-macos-latest-v1.16.0.zip"
        sha256 "f87c3bf86d407313d321f832ae34560e4a8edd3e48063ed504d9569753852ff5"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.16.0/krr-ubuntu-latest-v1.16.0.zip"
        sha256 "8fd816f19e618afa0e8e30c9892e1e6580263e39ecfb6a8e4032ce1616a3d806"
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
  
