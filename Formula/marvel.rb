class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261017.011906.e1d6088"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261017-011906-e1d6088/marvel-darwin-arm64"
    sha256 "f26570a17fcbc17b097b6c3f0b2f6dbd41b646ebfc865b55b18c9d07191833a7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261017-011906-e1d6088/marvel-darwin-amd64"
    sha256 "2577951341c8e5e2c24f8cedbbf00795e1a4f5e4be5544bc388b5b46dcd3c297"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261017-011906-e1d6088/marvel-linux-arm64"
    sha256 "fd30ce72157046e1ab02cdb589633bad6266ce60b679b65cf2dd71daec623121"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261017-011906-e1d6088/marvel-linux-amd64"
    sha256 "67aa386670ce514a66a4a498f9867d6ede394296b72f7f01d459e121bba5f442"
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
