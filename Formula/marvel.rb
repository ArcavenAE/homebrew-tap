class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.145002.cd6a467"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-145002-cd6a467/marvel-darwin-arm64"
    sha256 "b0f58fc97f9c6b6f5722aca0b577135934e9b46a42a7aa792506d21fb13abe81"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-145002-cd6a467/marvel-darwin-amd64"
    sha256 "ef4062467564f5d8d2055927051bf9f4811910d8155917622c01cb280f6f07d1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-145002-cd6a467/marvel-linux-arm64"
    sha256 "f3f5e662eba80e22764b116ee7e7194684c1e903dee49c9fb2ff9f0669bc93ef"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-145002-cd6a467/marvel-linux-amd64"
    sha256 "5385896aef891e320fc306597664a0c0818614649518aa7754d1c9a0fa1142a6"
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
