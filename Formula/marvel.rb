class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261128.042823.0b06471"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-042823-0b06471/marvel-darwin-arm64"
    sha256 "a550343b5371356af61701ec782ad9d22330a0ede2685032e393165a10316fe9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-042823-0b06471/marvel-darwin-amd64"
    sha256 "01979bd75ba9e35d433c66f87f2ac4266f6d848e039d2187cff2ef4363cee0b7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-042823-0b06471/marvel-linux-arm64"
    sha256 "f5e26e0f523e89aea36b8be219119f4ef0999a2f1c8045d40924887f5686c436"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-042823-0b06471/marvel-linux-amd64"
    sha256 "3f750b7eda2db8e5068d7b69989e00eea62adbe6147ba6763c401ec9a7f6ef24"
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
