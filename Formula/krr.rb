class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.22.0/krr-macos-latest-v1.22.0.zip"
        sha256 "da100ac6c1735bcbe6bcfc010e25215e2ba3536a6e57a78880cd2b522c96adf2"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.22.0/krr-ubuntu-latest-v1.22.0.zip"
        sha256 "bdb05171c12ff0139adbfaf706551a273d5c58f869b07af504ba8605db2d4d01"
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
  
