class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260806.134957.ea5b46b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260806-134957-ea5b46b/marvel-darwin-arm64"
    sha256 "dbff8a2d6c2c5f0f767d06eea2ecec89654ad1f6b233830fb337ccae0e19cb36"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260806-134957-ea5b46b/marvel-darwin-amd64"
    sha256 "325859238f3942dbc964c472443ba0230b07c011fe7d43361e248ceebe82a0f8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260806-134957-ea5b46b/marvel-linux-arm64"
    sha256 "b8a7d7033e58adc39d359774a419b6e811b204607802cc42c59d8c662f5de380"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260806-134957-ea5b46b/marvel-linux-amd64"
    sha256 "965450828f5054ebf27f86c58ee3676b542d54ede426e16650958b8812f51d4b"
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
