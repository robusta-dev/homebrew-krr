class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v.1.15.0/krr-macos-latest-v.1.15.0.zip"
        sha256 "607a290e9d30a8494eefdb109d62fc268345b124ba15d8d7593b06ff36ac92d7"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v.1.15.0/krr-ubuntu-latest-v.1.15.0.zip"
        sha256 "9eb975541ea2463aa321352b4591f1799c3a5bb8faec10243a6e49ccf82a18a6"
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
  
