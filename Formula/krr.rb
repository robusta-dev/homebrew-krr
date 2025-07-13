class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.24.0/krr-macos-latest-v1.24.0.zip"
        sha256 "1d9ec052d3d521a798289d94e26e767570d928d9d78e1e7dab02b497a84acaf5"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.24.0/krr-ubuntu-latest-v1.24.0.zip"
        sha256 "413985503775c12069d8da1a657f4b77a073426b8e50d2ffea451cdf25c52558"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
        # our binaries are built with pyinstaller and the first executable run is very slow because it unzips packages
        # to work around that, we "warm up" the binary here during installation so it is fast when the user runs it for the first timeo
        ohai "Running 'krr version' to warm up binary and extract compressed python libraries... this can take up to 60 seconds"
        system libexec/"krr", "version"
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
