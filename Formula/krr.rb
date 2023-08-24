class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.60-alpha/krr-macos-latest-v1.60-alpha.zip"
        sha256 "7230c11fa93812161f84576e4378a296406ddc9486dd8050f75cfd4604276aac"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.60-alpha/krr-ubuntu-latest-v1.60-alpha.zip"
        sha256 "62c9a125ff869788c18b290d00670af4cf8db629d2823356344657f0aa1628f9"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
