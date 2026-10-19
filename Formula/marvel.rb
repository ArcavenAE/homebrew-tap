class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.215644.67e695c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-215644-67e695c/marvel-darwin-arm64"
    sha256 "9cc41a50fdfc2f4925ba69232fe31320e0f8236ed109e032b09f231de0cf9b9e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-215644-67e695c/marvel-darwin-amd64"
    sha256 "78ddf62c56420bb57f267de9eccd722be3cbcebeb313e31b1f430fc7c819bff1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-215644-67e695c/marvel-linux-arm64"
    sha256 "84502a7b4165364e8fccad517fd3a028685fef6eaf540d26cd7e9441ef30d29a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-215644-67e695c/marvel-linux-amd64"
    sha256 "cb0c1ea8855a46ee1ef334f08c5acb62eb4e6c1c8a211ac4c79074fdc16ee4f4"
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
