class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.4.1/krr-macos-latest-v1.4.1.zip"
        sha256 "0822dd491e818ab8abafc5ffe69bd320f68ba6dc4ef22d503a3215c685920b9d"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.4.1/krr-ubuntu-latest-v1.4.1.zip"
        sha256 "a1103feed046f8441d5b799a68dcd9bc4fbafde2e91d8246b748c9e141bf101a"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
