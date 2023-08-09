class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.5.2-pre/krr-macos-latest-v1.5.2-pre.zip"
        sha256 "c53f4300fd6a3e06399b32dfbb30b4813351c3a40976fed881ba0c972ab129c0"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.5.2-pre/krr-ubuntu-latest-v1.5.2-pre.zip"
        sha256 "a0504341e229cfceb0ed9800e33d034c2711c84394654d5f455ffc8b67809f25"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
