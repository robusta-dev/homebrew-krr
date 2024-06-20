class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.11.0/krr-macos-latest-v1.11.0.zip"
        sha256 "c139416812dad0a99d5feb6d2352e2ca54259dd61c2e53f652747276a981a185"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.11.0/krr-ubuntu-latest-v1.11.0.zip"
        sha256 "3f93eb1ceb0a524dd16b8fe90482fbec26068c7c1a9c6d4b1f33875bbf26d51c"
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
  
