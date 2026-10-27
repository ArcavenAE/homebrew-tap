class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.220613.412da1c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-220613-412da1c/marvel-darwin-arm64"
    sha256 "b5c06f6d976703d3572fe90c518fa91f246529b0527a4cb02d4725221c703244"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-220613-412da1c/marvel-darwin-amd64"
    sha256 "bf967d2612558a24bf3f96f57906bcc96bfb6f4b7259a3e9a46daab66e583a60"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-220613-412da1c/marvel-linux-arm64"
    sha256 "d90ece67c2d5521290ae6e46776cb999135fb7e893cf9f6399df62d0fddcdc75"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-220613-412da1c/marvel-linux-amd64"
    sha256 "ba5ea270f2d20b30d3ba496bfd4547ef8bd181a39b7788ea31ceff0775d924db"
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
