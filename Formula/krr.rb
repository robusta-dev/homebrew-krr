class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/1.10.0-alpha/krr-macos-latest-1.10.0-alpha.zip"
        sha256 "1d20a497b96968316c1d1fc9d302ad40419b305a20fc22d7e04ec1b84857fccc"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/1.10.0-alpha/krr-ubuntu-latest-1.10.0-alpha.zip"
        sha256 "a98e4364ad1ea94ba1eeb18502b19a04543951024816e5d4ab5d31649e402c44"
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
  
