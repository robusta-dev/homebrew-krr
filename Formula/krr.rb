class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.2.0/krr-macos-latest-v1.2.0.zip"
        sha256 "ab49bdb2713d0c6ab575fba356818d63c2d37f58ec0403eac938dc7213989d1c"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.2.0/krr-linux-latest-v1.2.0.zip"
        sha256 "83f722a5fc7c01b0f2780d4b692585647ae2f8b6e765245cff19e1c16f14b038"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
