class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.134501.23d1c77"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134501-23d1c77/marvel-darwin-arm64"
    sha256 "31ffaa222180eefc06c0f7523679d179e46c61a7de72dae0c3c92a809dee7eac"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134501-23d1c77/marvel-darwin-amd64"
    sha256 "0d36ea1eebbe3e99c555cec9a779fe94396e451505d1c60a606c82b8219037ac"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134501-23d1c77/marvel-linux-arm64"
    sha256 "827415c455a75b33124f9ca62bc9ea231cec7b6ab8371759e08a3f2fcc9ef3a6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134501-23d1c77/marvel-linux-amd64"
    sha256 "ececfc9785c4988278201c6aa3d737fbcefe5caabef8fe0ee8a3ac4942b7b838"
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
