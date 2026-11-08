class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261108.055313.52b2fdf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-055313-52b2fdf/marvel-darwin-arm64"
    sha256 "e65571725683b8be0bd5640c6cff3b856aa6be3cb7080e5ee6c00549ef634799"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-055313-52b2fdf/marvel-darwin-amd64"
    sha256 "df689fd181152e238d1ed8d68f00175cabeee278b65ab57163b9187ccca5edd7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-055313-52b2fdf/marvel-linux-arm64"
    sha256 "e1467736d9b0f3a65bbb94c7372e3d43de95886cae85286f0c61fa49a800ee1d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-055313-52b2fdf/marvel-linux-amd64"
    sha256 "245d3a74a8e16d5848445b24d18d88da082854d24ea306811f7bfb01d9ce4ab9"
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
