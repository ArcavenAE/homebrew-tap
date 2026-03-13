class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.174753.b86bb54"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-174753-b86bb54/threedoors-a-darwin-arm64"
    sha256 "d9602fff36e0a34e7745cd5dd733bc71f8d1ed7a8dc99cba9bd8da9975f57a76"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-174753-b86bb54/threedoors-a-darwin-amd64"
    sha256 "6b381218a681670f41b15d0d19164f8de02385aacc006c58a6fcadffb293e5d3"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-174753-b86bb54/threedoors-a-linux-amd64"
    sha256 "c6d14e2660fc342dd2db1f37c2ac21f74d6978699c0480c9262d2636522cec63"
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
