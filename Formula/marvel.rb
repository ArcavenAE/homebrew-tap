class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.084731.01b1f93"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-084731-01b1f93/marvel-darwin-arm64"
    sha256 "2680a1a85e50357d91ae008d71cac9a058edfe8b3b35144de606f8025f12e5e1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-084731-01b1f93/marvel-darwin-amd64"
    sha256 "e2fe46719fa2390fcd26c9c816d01160e491143a09a1e98d168901a9f3561882"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-084731-01b1f93/marvel-linux-arm64"
    sha256 "2554ca9371fc509fb175bfdb9169d559b015d04c0c0a2eefd64cfacf7ec1aada"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-084731-01b1f93/marvel-linux-amd64"
    sha256 "186ecc3a1f26a64f6bfda58264bd7209c1765205714a892052f9c04ad59e831d"
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
