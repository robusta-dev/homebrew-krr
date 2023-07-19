class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.4.0/krr-macos-latest-v1.4.0.zip"
        sha256 "d8cd5ea5097d1d13129feba0906fe9ab8f36ad8c12a97d3d4d963900a91bd733"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.4.0/krr-ubuntu-latest-v1.4.0.zip"
        sha256 "3d610afa317c449422ca3b9eb4aafe5328046a7663dbecbce3e478d425dd7e9b"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
