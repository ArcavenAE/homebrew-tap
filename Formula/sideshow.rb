class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261021.011140.e934d34"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011140-e934d34/sideshow-darwin-arm64"
    sha256 "df84cb68fc9faa3ae9b9bdf2b2074d1fd65a8df1c8e1fc9ae21cdafc8433bd7b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011140-e934d34/sideshow-darwin-amd64"
    sha256 "cebc19bc713984bc37ef6c7b301e2732be795cb765b72e2e3fda001f5ccd38fd"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011140-e934d34/sideshow-linux-amd64"
    sha256 "f1192ceb53d8a730d1345cab32b11aa44ad71da4db9fb68781215a96de9ce416"
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
