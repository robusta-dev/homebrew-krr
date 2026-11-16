class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.31.3/krr-macos-latest-v1.31.3.zip"
        sha256 "6f607208564c5f86996b4f77f19fdf2658f66165cfe7adbf9d056cd27b29284d"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.31.3/krr-ubuntu-latest-v1.31.3.zip"
        sha256 "11e22ffd93aa53d3816a636ba61a42121108a48e7f4cc183779cf742a8c2033a"
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
  
