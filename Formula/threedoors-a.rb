class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260401.025451.3e96efc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-025451-3e96efc/threedoors-a-darwin-arm64"
    sha256 "d74510cb4185d664d96cafae18a8983fe198997fc952e3bd58e28cdf6429033e"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-025451-3e96efc/threedoors-a-darwin-amd64"
    sha256 "d9fd2643074d9f9a704ffb24be37bb3d5fb8ed265496a21011156df40032a5df"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-025451-3e96efc/threedoors-a-linux-amd64"
    sha256 "761e451a7b6b25ca193e72defa8ccd275e47373d54b30154edbf45b7f99bbebe"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
