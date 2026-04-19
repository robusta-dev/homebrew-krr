class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.28.0/krr-macos-latest-v1.28.0.zip"
        sha256 "1d58f0023644ad1134d88f9176585ff693908715cfd2263907a771c1a4d8dd17"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.28.0/krr-ubuntu-latest-v1.28.0.zip"
        sha256 "fd699bd17b1327b6c969d0432ffdaec5481e2f0195d713887fc2a5369459bee0"
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
  
