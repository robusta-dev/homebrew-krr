class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.26.0/krr-macos-latest-v1.26.0.zip"
        sha256 "2385561a46a2bf4768902156905b63c30ce767ffa3bc62d9e36bb7ea07958212"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.26.0/krr-ubuntu-latest-v1.26.0.zip"
        sha256 "0f191b698be3375b6382dc80111193144457948393bf3debce3f0c273223c9c4"
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
  
