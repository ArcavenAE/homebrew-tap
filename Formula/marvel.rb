class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.224742.3771243"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-224742-3771243/marvel-darwin-arm64"
    sha256 "5fbd4f77c6331f00f7bd09a13765b013c3c4b8b95dc1fe723d2d26b45b727896"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-224742-3771243/marvel-darwin-amd64"
    sha256 "b9ae84ece5e8c1f28caf0c17666d1ffbe80cd072d4f009fd5b80d3738cdbd8ee"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-224742-3771243/marvel-linux-arm64"
    sha256 "3eb1762fc0b0edabeb1724f76fa6ad5e1145459d8976d29959d0f30b30345cfa"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-224742-3771243/marvel-linux-amd64"
    sha256 "aae439bfe87c6a657f3c5c9e4767639cd867894d234906943121436edcc3d731"
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
