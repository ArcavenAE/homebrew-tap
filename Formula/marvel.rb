class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.062855.10b793c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-062855-10b793c/marvel-darwin-arm64"
    sha256 "13ae62d0a0fc23b5d82d96b06e5841fd016b1c38ff1f044a8a2f3b37955734e9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-062855-10b793c/marvel-darwin-amd64"
    sha256 "fe231f856867b27acdf7a2c8b58052d9be21141307e53ab75e013a29bcc207b8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-062855-10b793c/marvel-linux-arm64"
    sha256 "ace29a2817a52aad7780f8e53af2a772c5849685f46875aab8016079e99f714f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-062855-10b793c/marvel-linux-amd64"
    sha256 "b65376f3e5620e3645eabee0df6fa9876147f31ad7ac2cc2f8da5981f68651c3"
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
