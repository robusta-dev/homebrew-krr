class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.7.1/krr-macos-latest-v1.7.1.zip"
        sha256 "b5a342644ae5acbf4976c355f34ba8ddd7536da368a25cc64c9c29479d6f1cdb"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.7.1/krr-ubuntu-latest-v1.7.1.zip"
        sha256 "12d45ad6e8a6d5fe281bb05987ccc63da837d3e9cbf4648891a6920d3be3c6eb"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
