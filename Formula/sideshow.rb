class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261128.035750.4cbae49"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261128-035750-4cbae49/sideshow-darwin-arm64"
    sha256 "5dfb6139d73782ad594ac9fb7748fc3ec0b1af96467d1bb071106a9582f3a911"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261128-035750-4cbae49/sideshow-darwin-amd64"
    sha256 "cf145e491ef025e373a8bb65b19a457b36d0c265abff894f651ef623789397ed"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261128-035750-4cbae49/sideshow-linux-amd64"
    sha256 "620ab843e21c6dbeeca459b74350a3eac6d38d722ef20a16a7a8475098b157bf"
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
