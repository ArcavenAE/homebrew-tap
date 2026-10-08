class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.053447.ca9f7fe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-053447-ca9f7fe/marvel-darwin-arm64"
    sha256 "1ca5712c1a67610ea6733dbb7a952db163e426ee82636f29427bf6d9719cb434"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-053447-ca9f7fe/marvel-darwin-amd64"
    sha256 "e77ddb093de115d8ee21ada86b28baa11207e3f68b53165c2d5f0ff6743a708e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-053447-ca9f7fe/marvel-linux-arm64"
    sha256 "58189bacffde966467fe2acc8fae41cbbafe0bd2f40cb1c4c377c989c4265050"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-053447-ca9f7fe/marvel-linux-amd64"
    sha256 "f56c9dbd8919f11aaa3e73ccb4ff3a18fcd6b61ff415ee84ff7f8c102c2aa5b5"
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
