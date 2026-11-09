class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.154514.1ba5385"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-154514-1ba5385/marvel-darwin-arm64"
    sha256 "c8fcdfa7fced16ecd5a2a258fb0066019422baa2859ce2d16232f566c9ef9c58"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-154514-1ba5385/marvel-darwin-amd64"
    sha256 "7abdd6784e62d225385380fafd945ca98147a3449a5e4f3c591e64505a3fe1fa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-154514-1ba5385/marvel-linux-arm64"
    sha256 "6c6a82642634b9920d506d881f26e7cfe42bed649411cdb409b0e76431ecd67d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-154514-1ba5385/marvel-linux-amd64"
    sha256 "1273a52d2f0cc323b2bdad4fd781fde6fcdd2404ccc5a5764ea3aaeacf25db90"
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
