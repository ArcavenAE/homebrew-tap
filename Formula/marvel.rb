class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.024925.7123ce4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-024925-7123ce4/marvel-darwin-arm64"
    sha256 "d2592dffe27d7b41a7560715c71747dc1eabd4363966ecb992ba3d26e4383214"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-024925-7123ce4/marvel-darwin-amd64"
    sha256 "f7f2dfa2b926e4c6e1d4935a454eeb5e77b31434ce8c9eea7f37da0f31a8d1b7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-024925-7123ce4/marvel-linux-arm64"
    sha256 "48985aac76f1d1e053a2bdd2e9d0e04e97d11b81a1c8816c5e5b05b5e06e3f63"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-024925-7123ce4/marvel-linux-amd64"
    sha256 "73e0b0a12e95c538e30ee5dcf8e380461f354a2c8e1b315e6ef81fd3d2d72374"
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
