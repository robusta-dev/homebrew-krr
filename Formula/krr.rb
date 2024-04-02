class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.8.2/krr-macos-latest-v1.8.2.zip"
        sha256 "9820d4171089c50e4451bdeb1039c9a3ec6ccb251d9c4cec1bdc2268da262e7b"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.8.2/krr-ubuntu-latest-v1.8.2.zip"
        sha256 "b4fef0698d56afb2084defdc056e68024893accc6846b23b4bafd3dc2b93b5fd"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
