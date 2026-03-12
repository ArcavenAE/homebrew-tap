class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.030559.44be717"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-030559-44be717/threedoors-a-darwin-arm64"
    sha256 "929e0c992a14a32c09c5b3225a85815fcfe7d19ba77102a878062421c14988c2"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-030559-44be717/threedoors-a-darwin-amd64"
    sha256 "7ac45490b6cd97cfa89a3ff497321f6eb2adad82aa59438d47153bc19f2618cd"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-030559-44be717/threedoors-a-linux-amd64"
    sha256 "8b6f1e2324ef4b640c3d92c6832f96aac9af2fd5c57bf8d4e42171ace63c4d89"
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
