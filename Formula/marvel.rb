class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.002454.6d804be"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-002454-6d804be/marvel-darwin-arm64"
    sha256 "30e5ad6575e9dfa179d52961c7f16b83b6e28c8b496c152268e981f6778a0c45"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-002454-6d804be/marvel-darwin-amd64"
    sha256 "a91c2fe0d157b639a184fd1f741a14997d4560a3af3f47afd97e64f768387a5e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-002454-6d804be/marvel-linux-amd64"
    sha256 "49b9ff50a9b4f513a638f2176616756ba8c355e35d9d027b965f80992f29a1a7"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
