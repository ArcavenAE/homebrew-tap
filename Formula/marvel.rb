class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.171745.50f0049"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-171745-50f0049/marvel-darwin-arm64"
    sha256 "a30468df0695eed6633c6f657e948b338ab565722e460b7c646ddb46d365aa33"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-171745-50f0049/marvel-darwin-amd64"
    sha256 "3aacf9dbc1b50107badb2b403a75669b782fbcbf9469a01e5fc17b91efa26120"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-171745-50f0049/marvel-linux-arm64"
    sha256 "db7e424a493ea026d8087649f1a8b80dc10bb0af1bbe01b30dc305dd3a381c01"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-171745-50f0049/marvel-linux-amd64"
    sha256 "bada9dd3e9a691867d60435628d2feb8e877fa9855405d6753da5b94e38647bd"
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
