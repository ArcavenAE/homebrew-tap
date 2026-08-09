class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.070206.f118e32"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070206-f118e32/marvel-darwin-arm64"
    sha256 "476a04e4730863384b6d4cb71185e240156200abeed3e2bc99b9859486e0350a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070206-f118e32/marvel-darwin-amd64"
    sha256 "60de264352817b8462233adad06cc6397508f7f836c78b59656249b7d8dd4bb1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070206-f118e32/marvel-linux-arm64"
    sha256 "c645e016865a0dddf9ca6b9704c92b19e3fdb05a2f7c36122e95bb1c245198ef"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070206-f118e32/marvel-linux-amd64"
    sha256 "878747172fcce483342046803af1a42d2d482ad6b9b3c64849a4e2bdc0de108c"
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
