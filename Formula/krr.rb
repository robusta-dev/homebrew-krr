class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.17.0/krr-macos-latest-v1.17.0.zip"
        sha256 "c28618be597c8472b8496b6e435a33589d05abe2b75270c7539673e864d0273a"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.17.0/krr-ubuntu-latest-v1.17.0.zip"
        sha256 "9e26075492bc2a777399ac00993e69e82ab477f5bee32e0c7db6213d66a31bc6"
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
  
