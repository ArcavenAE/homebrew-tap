class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261109.203908.bf84a93"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261109-203908-bf84a93/sideshow-darwin-arm64"
    sha256 "2aac2635dca559e22f5de26b5a12abb1d693c8c815b4b81d19e99eb7b9daac6e"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261109-203908-bf84a93/sideshow-darwin-amd64"
    sha256 "ff3d8cbe038178ae3415a6c6eed3e484631f56e60df71e6629d5d45d427af04d"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261109-203908-bf84a93/sideshow-linux-amd64"
    sha256 "2abca56528f5122bf0c16077b30f8fd0891eef6c56efb06f21501fea15dfad61"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
