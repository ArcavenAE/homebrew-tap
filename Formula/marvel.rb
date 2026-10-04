class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.053435.4042b6e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053435-4042b6e/marvel-darwin-arm64"
    sha256 "aff5bb0e3f3b130faadf8db9a1694df22422b85f4cb59ce349663f989f5ec875"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053435-4042b6e/marvel-darwin-amd64"
    sha256 "82b14d37f8711eabd9a7a72331d2dc6ffffa209d6aa90d1c28efc42c99c86fe6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053435-4042b6e/marvel-linux-arm64"
    sha256 "82bf4c62d24a40e430d95f1d19163a0ad3bbe4a467bc6b68c1cc41227b9e172a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053435-4042b6e/marvel-linux-amd64"
    sha256 "24e929cba5a7f53f1c6159f332eae683f838c592f9e434ce5181ec92a04c0cbb"
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
