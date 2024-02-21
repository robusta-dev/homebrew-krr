class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.7.0/krr-macos-latest-v1.7.0.zip"
        sha256 "9df06516909d3074c71d3166f2ca5b7e14464e4c2ebc9a8f5c61effe0b3434ff"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.7.0/krr-ubuntu-latest-v1.7.0.zip"
        sha256 "71d92c403fab961b65471b44645d718f0dd36b257aa2907276c4f01dc7107a55"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
