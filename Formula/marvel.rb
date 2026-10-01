class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261001.022811.f778d0b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-022811-f778d0b/marvel-darwin-arm64"
    sha256 "1d0417644311cb6cc4bb6abf379957417dacf2d38b09e66f4fa1443ce81564e6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-022811-f778d0b/marvel-darwin-amd64"
    sha256 "bf27606243db3ff86af88d2bf7735323c76e37e079c8ae905ea6fab1e2d9b6db"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-022811-f778d0b/marvel-linux-arm64"
    sha256 "c838dd2f243ddc30dcb836b8fbc281c56d119acb38943e53c538701db3308adb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-022811-f778d0b/marvel-linux-amd64"
    sha256 "c396173c245ec12f62d1e604ce25f03aacb3ab810cd0e5d4fc082afcff0c7ea6"
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
