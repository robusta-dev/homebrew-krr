class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.26.1/krr-macos-latest-v1.26.1.zip"
        sha256 "be743915d6b9c56401d31a711f8ff1ac8c22065109fd261d83acaea5304a81b8"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.26.1/krr-ubuntu-latest-v1.26.1.zip"
        sha256 "d6fb477a90b868c6e6ce3ec2a58ed8d07968b4b3eab8ac6c53ba57e6dcaca468"
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
  
