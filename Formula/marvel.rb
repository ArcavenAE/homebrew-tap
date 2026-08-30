class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.093450.08f52bf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093450-08f52bf/marvel-darwin-arm64"
    sha256 "50ee46ad74d295f9e01133658669292616537184655758340f1d524ba5ef0c32"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093450-08f52bf/marvel-darwin-amd64"
    sha256 "f0d23210fce7f0567c8051118f0bc5c2994e490710c6fab02e70e2f9963ae944"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093450-08f52bf/marvel-linux-arm64"
    sha256 "3e9379731b0848fb39757f215659a7ee9548d92e8e0898e5fd05da38e80faa08"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093450-08f52bf/marvel-linux-amd64"
    sha256 "945fd0215e4b0789169a17b64226cae96d5db385510563b551a080e58478084b"
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
