class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260713.174626.660f9aa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-174626-660f9aa/sideshow-darwin-arm64"
    sha256 "4240625baabc339f35bd00cf4347fbb4abd954d537adf5d688e344d62069b25a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-174626-660f9aa/sideshow-darwin-amd64"
    sha256 "1d29a2847aa9fbedc0e36782e7a0c92f4dd4d75157306d994dbd7ef0225aec7f"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-174626-660f9aa/sideshow-linux-amd64"
    sha256 "094e07f74f09c9e23f63a819d066d9d9b4db1bff0f44de8671f24474c0c898c9"
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
