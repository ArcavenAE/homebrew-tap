class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.181920.4219bca"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-181920-4219bca/marvel-darwin-arm64"
    sha256 "05fd2a935221c45ff555dca6d6dc8771e7b647e1521c486a4c3be43764b3c34e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-181920-4219bca/marvel-darwin-amd64"
    sha256 "8078b9c68a78d151ece7977d7ca157055479698b13c56706d00cb17bb89027f9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-181920-4219bca/marvel-linux-arm64"
    sha256 "de55899861c830d2f9e0ef0acbe6ad9c5a2af296336c4e0676f382631cbbf678"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-181920-4219bca/marvel-linux-amd64"
    sha256 "52e7df47b3948e0f6edc5a8c5fda202fd043a1a495bfb6e86de4f7f4278a7816"
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
