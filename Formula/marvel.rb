class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.014925.249a150"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-014925-249a150/marvel-darwin-arm64"
    sha256 "5413c40fc6b27a951befef0f735e7a7cd955891b514bb88c6bd93f605225657b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-014925-249a150/marvel-darwin-amd64"
    sha256 "7c05431a32076831226559ac1cb15da4e050e7085cf5a4ea6b5b17c41b3e7ea3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-014925-249a150/marvel-linux-arm64"
    sha256 "dd36d625ae618d06af63ba7bd2f4d7fefd924a67f83c8ee9246ba01aab7bf8a5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-014925-249a150/marvel-linux-amd64"
    sha256 "8a9340ccb74f359e89b1b4f0cd397cbb8d4fb9755c8ad3df317fb4c3d9d81c8d"
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
