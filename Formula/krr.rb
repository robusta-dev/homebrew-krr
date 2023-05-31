class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.2.1-rc2/krr-macos-latest-v1.2.1-rc2.zip"
        sha256 "96c79c6804c303e5933d9c5ce4d781c31dd38d88957f2074ad18b2f9999bffce"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.2.1-rc2/krr-linux-latest-v1.2.1-rc2.zip"
        sha256 "412d41ab1bb0b286c9430646abd4d7381e5005f511147b807da4558ab164635f"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
