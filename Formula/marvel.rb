class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.002946.5f26f86"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-002946-5f26f86/marvel-darwin-arm64"
    sha256 "b57081c3da4ea0364127fc9f9892d8f0e29558817c3db06cef9adf204386755f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-002946-5f26f86/marvel-darwin-amd64"
    sha256 "4428639dd88535b3348d05ff65bb9f7ea3072af834821267b73e514902636ed7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-002946-5f26f86/marvel-linux-arm64"
    sha256 "6ec49b7eba6333f6844f0ff687b6919c712ffdaea257f91461c588a8f11c207e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-002946-5f26f86/marvel-linux-amd64"
    sha256 "f605c136c65ab1e5135067368b3efe859f9999750eae650305bbec94c4d01662"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
