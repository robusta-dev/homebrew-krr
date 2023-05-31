class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.2.1/krr-macos-latest-v1.2.1.zip"
        sha256 "f43a992bece07d9ac8ecd6d32524c3225def2ede743971f8e71ab7caa6aafbbb"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.2.1/krr-linux-latest-v1.2.1.zip"
        sha256 "6fe37a2bb03abe011984de338548c5168afa7a06f82e8252d719fad57943a75c"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
