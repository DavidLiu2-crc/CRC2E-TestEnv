

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/calib3d/calib3d.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char* argv[]) {
	// Image relative path string
	Mat cal1 = imread("ladybug_Rectified_Cam_00.jpg", 1);
	Mat cal2 = imread("ladybug_Rectified_Cam_01.jpg", 1);

	vector<Point2f> pointbuf;
	bool found = findChessboardCorners(cal1, [10, 7], pointbuf, CALIB_CB_ADAPTIVE_THRESH);
	

	// Create cv image
	//Mat src = imread(argv[1], 1);
	//Mat src = imread("ladybug_Rectified_Cam0.jpg", 1);
	//Mat dst;
	//rotate(src, dst, cv::ROTATE_90_CLOCKWISE);
	//imwrite(pathOutput, dst);

	return 0;
}
