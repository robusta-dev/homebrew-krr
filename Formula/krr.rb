class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
      url "https://github.com/robusta-dev/krr/releases/download/v1.1.0/krr-macos-v1.1.0.zip"
      sha256 "12228ba125aeba297d1d256a663e28f089dc35cdb318c5be7eb9d90f675bf1b4"
    elsif OS.linux?
      url "https://github.com/robusta-dev/krr/releases/download/v1.1.0/krr-linux-v1.1.0.zip"
      sha256 "12712e6009a445da4f0564fc913eba444fd29b670fddb201bb8db13ed5861aef"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  